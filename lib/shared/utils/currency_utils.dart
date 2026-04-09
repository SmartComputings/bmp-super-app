/// Currency utility functions
class CurrencyUtils {
  CurrencyUtils._();

  /// Get currency symbol for a currency code
  static String getSymbol(String currency) {
    switch (currency.toLowerCase()) {
      case 'usd':
        return '\$';
      case 'eur':
        return '€';
      case 'gbp':
        return '£';
      case 'inr':
        return '₹';
      case 'pkr':
        return 'Rs';
      case 'aed':
        return 'د.إ';
      case 'sar':
        return '﷼';
      case 'jpy':
        return '¥';
      case 'cny':
        return '¥';
      case 'aud':
        return 'A\$';
      case 'cad':
        return 'C\$';
      default:
        return currency.toUpperCase();
    }
  }

  /// Format amount in cents to display string
  static String formatAmount(int amountInCents, String currency) {
    final amount = amountInCents / 100;
    final symbol = getSymbol(currency);
    return '$symbol${amount.toStringAsFixed(2)}';
  }
}
