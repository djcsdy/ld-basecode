package net.noiseinstitute.basecode.formatters {
    public class FixedNumberFormatter implements INumberFormatter {
        private static var zeroes:String;

        static {
            zeroes = new Array(256).join("0");
        }

        public var decimalDigits:int;
        public var minWholeDigits:int;

        public function FixedNumberFormatter (decimalDigits:int=0, minWholeDigits:int=0) {
            this.decimalDigits = decimalDigits;
            this.minWholeDigits = minWholeDigits;
        }

        public function format (n:Number):String {
            var s:String = n.toFixed(decimalDigits);

            var numWholeDigits:int = s.indexOf(".");
            if (numWholeDigits < 0) {
                numWholeDigits = s.length;
            }

            if (numWholeDigits >= minWholeDigits) {
                return s;
            } else {
                return zeroes.substr(0, minWholeDigits-numWholeDigits) + s;
            }
        }
    }
}
