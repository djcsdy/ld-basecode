package net.noiseinstitute.basecode.formatters {
    public class DefaultNumberFormatter implements INumberFormatter {
        private static var _instance:DefaultNumberFormatter;

        public static function get instance ():DefaultNumberFormatter {
            return _instance || (_instance = new DefaultNumberFormatter());
        }

        public function format (n:Number):String {
            return n.toString();
        }
    }
}
