import 'dart:async';

import 'package:bmp/core/config/setting_keys.dart';
import 'package:bmp/features/chat/chat/recording_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path_lib;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../core/localization/l10n.dart';

class InlineVoiceRecorder extends StatefulWidget {
  final Function(RecordingResult) onRecordingComplete;
  final VoidCallback onCancel;

  const InlineVoiceRecorder({
    super.key,
    required this.onRecordingComplete,
    required this.onCancel,
  });

  @override
  State<InlineVoiceRecorder> createState() => _InlineVoiceRecorderState();
}

class _InlineVoiceRecorderState extends State<InlineVoiceRecorder> {
  Timer? _recorderSubscription;
  Duration _duration = Duration.zero;
  bool error = false;
  bool isRecording = true;
  final _audioRecorder = AudioRecorder();
  final List<double> amplitudeTimeline = [];
  String? fileName;

  @override
  void initState() {
    super.initState();
    startRecording();
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    _recorderSubscription?.cancel();
    _audioRecorder.stop();
    super.dispose();
  }

  Future<void> startRecording() async {
    final store = Matrix.of(context).store;
    try {
      final codec = kIsWeb
          ? AudioEncoder.wav
          : await _audioRecorder.isEncoderSupported(AudioEncoder.opus)
              ? AudioEncoder.opus
              : AudioEncoder.aacLc;
      fileName =
          'recording${DateTime.now().microsecondsSinceEpoch}.${codec.fileExtension}';
      String? path;
      if (!kIsWeb) {
        final tempDir = await getTemporaryDirectory();
        path = path_lib.join(tempDir.path, fileName);
      }

      final result = await _audioRecorder.hasPermission();
      if (result != true) {
        setState(() => error = true);
        return;
      }
      await WakelockPlus.enable();

      await _audioRecorder.start(
        RecordConfig(
          encoder: codec,
          bitRate: AppSettings.audioRecordingBitRate.getItem(store),
          sampleRate: AppSettings.audioRecordingSamplingRate.getItem(store),
          numChannels: AppSettings.audioRecordingNumChannels.getItem(store),
          autoGain: AppSettings.audioRecordingAutoGain.getItem(store),
          echoCancel: AppSettings.audioRecordingEchoCancel.getItem(store),
          noiseSuppress: AppSettings.audioRecordingNoiseSuppress.getItem(store),
        ),
        path: path ?? '',
      );
      setState(() => _duration = Duration.zero);
      _recorderSubscription?.cancel();
      _recorderSubscription =
          Timer.periodic(const Duration(milliseconds: 100), (_) async {
        final amplitude = await _audioRecorder.getAmplitude();
        var value = 100 + amplitude.current * 2;
        value = value < 1 ? 1 : value;
        amplitudeTimeline.add(value);
        setState(() {
          _duration += const Duration(milliseconds: 100);
        });
      });
    } catch (_) {
      setState(() => error = true);
      rethrow;
    }
  }

  void _stopAndSend() async {
    _recorderSubscription?.cancel();
    final path = await _audioRecorder.stop();

    if (path == null) throw (L10n.of(context).recordingFailed);
    const waveCount = 64;
    final step = amplitudeTimeline.length < waveCount
        ? 1
        : (amplitudeTimeline.length / waveCount).round();
    final waveform = <int>[];
    for (var i = 0; i < amplitudeTimeline.length; i += step) {
      waveform.add((amplitudeTimeline[i] / 100 * 1024).round());
    }

    widget.onRecordingComplete(
      RecordingResult(
        path: path,
        duration: _duration.inMilliseconds,
        waveform: waveform,
        fileName: fileName,
      ),
    );
  }

  void _toggleRecording() {
    setState(() {
      isRecording = !isRecording;
    });
    if (isRecording) {
      startRecording();
    } else {
      _recorderSubscription?.cancel();
      _audioRecorder.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    final time =
        '${_duration.inMinutes.toString().padLeft(2, '0')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: isRecording
                    ? const Color(0xFFF63D3D)
                    : const Color(0x33858188),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              time,
              style: const TextStyle(
                color: Color(0xFFF3F3F3),
                fontSize: 14,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final maxBars =
                      (constraints.maxWidth / 5).floor().clamp(1, 77);
                  return SizedBox(
                    height: 34,
                    child: Row(
                      children: amplitudeTimeline.reversed
                          .take(maxBars)
                          .toList()
                          .reversed
                          .map(
                            (amplitude) => Container(
                              width: 3,
                              height: (amplitude / 100 * 34).clamp(4, 34),
                              margin: const EdgeInsets.only(right: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: widget.onCancel,
              child: Center(
                child: Image.asset(
                  'assets/images/icons/trash (1).png',
                  width: 32,
                  height: 32,
                  color: const Color(0xFFF63D3D),
                ),
              ),
            ),
            GestureDetector(
              onTap: _toggleRecording,
              child: Center(
                child: Image.asset(
                  'assets/images/icons/Icon Button (5).png',
                  width:60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            GestureDetector(
              onTap: _stopAndSend,
              child: Image.asset(
                'assets/chat_icons/send (1).png',
                width: 32,
                height: 32,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

extension on AudioEncoder {
  String get fileExtension {
    switch (this) {
      case AudioEncoder.aacLc:
      case AudioEncoder.aacEld:
      case AudioEncoder.aacHe:
        return 'm4a';
      case AudioEncoder.opus:
        return 'ogg';
      case AudioEncoder.wav:
        return 'wav';
      case AudioEncoder.amrNb:
      case AudioEncoder.amrWb:
      case AudioEncoder.flac:
      case AudioEncoder.pcm16bits:
        throw UnsupportedError('Not yet used');
    }
  }
}
