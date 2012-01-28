package net.noiseinstitute.basecode.formatters {
    public class SiNumberFormatter implements INumberFormatter {
        private static const siPrefixes:Vector.<String>
                = new <String>["y", "z", "a", "f", "p", "n", "μ", "m",
                        "", "k", "M", "G", "T", "P", "E", "Z", "Y"];

        public function format(n:Number):String {
            var divisor:Number = 1000000000000000000000000;
            for (var i:int=16; i>0; --i) {
                if (n > divisor) {
                    if (divisor == 1) {
                        return n.toFixed(0);
                    } else {
                        return (1000 * n / divisor).toFixed(2) + siPrefixes[i];
                    }
                } else {
                    divisor *= 0.001;
                }
            }

            return (1000 * n / divisor).toFixed(2) + siPrefixes[0];
        }
    }
}
