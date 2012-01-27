package net.noiseinstitute.basecode {
    import net.flashpunk.utils.Ease;

    public class Ease {
        /** Quadratic in. */
        public static function quadIn():Function {
            return net.flashpunk.utils.Ease.quadIn;
        }

        /** Quadratic out. */
        public static function quadOut():Function {
            return net.flashpunk.utils.Ease.quadOut;
        }

        /** Quadratic in and out. */
        public static function quadInOut():Function {
            return net.flashpunk.utils.Ease.quadInOut;
        }

        /** Cubic in. */
        public static function cubeIn():Function {
            return net.flashpunk.utils.Ease.cubeIn;
        }

        /** Cubic out. */
        public static function cubeOut():Function {
            return net.flashpunk.utils.Ease.cubeOut;
        }

        /** Cubic in and out. */
        public static function cubeInOut():Function {
            return net.flashpunk.utils.Ease.cubeInOut;
        }

        /** Quartic in. */
        public static function quartIn():Function {
            return net.flashpunk.utils.Ease.quartIn;
        }

        /** Quartic out. */
        public static function quartOut():Function {
            return net.flashpunk.utils.Ease.quartOut;
        }

        /** Quartic in and out. */
        public static function quartInOut():Function {
            return net.flashpunk.utils.Ease.quartInOut;
        }

        /** Quintic in. */
        public static function quintIn():Function {
            return net.flashpunk.utils.Ease.quintIn;
        }

        /** Quintic out. */
        public static function quintOut():Function {
            return net.flashpunk.utils.Ease.quintOut;
        }

        /** Quintic in and out. */
        public static function quintInOut():Function {
            return net.flashpunk.utils.Ease.quintInOut;
        }

        /** Sine in. */
        public static function sineIn():Function {
            return net.flashpunk.utils.Ease.sineIn;
        }

        /** Sine out. */
        public static function sineOut():Function {
            return net.flashpunk.utils.Ease.sineOut;
        }

        /** Sine in and out. */
        public static function sineInOut():Function {
            return net.flashpunk.utils.Ease.sineInOut;
        }

        /** Bounce in. */
        public static function bounceIn():Function {
            return net.flashpunk.utils.Ease.bounceIn;
        }

        /** Bounce out. */
        public static function bounceOut():Function {
            return net.flashpunk.utils.Ease.bounceOut;
        }

        /** Bounce in and out. */
        public static function bounceInOut():Function {
            return net.flashpunk.utils.Ease.bounceInOut;
        }

        /** Circle in. */
        public static function circIn():Function {
            return net.flashpunk.utils.Ease.circIn;
        }

        /** Circle out. */
        public static function circOut():Function {
            return net.flashpunk.utils.Ease.circOut;
        }

        /** Circle in and out. */
        public static function circInOut():Function {
            return net.flashpunk.utils.Ease.circInOut;
        }

        /** Exponential in. */
        public static function expoIn(base:Number=2, power:Number=10):Function {
            var min:Number = Math.pow(base, -power);
            var scale:Number = 1/(1-min);

            return function(t:Number):Number {
                return scale * (Math.pow(base, power * (t-1)) - min);
            };
        }

        /** Exponential out. */
        public static function expoOut(base:Number=2, power:Number=10):Function {
            var min:Number = Math.pow(base, -power);
            var scale:Number = 1/(1-min);

            return function(t:Number):Number {
                return scale * (1 - Math.pow(base, -power * t));
            }
        }

        /** Exponential in and out. */
        public static function expoInOut(base:Number=2, power:Number=10):Function {
            var min:Number = Math.pow(base, -power);
            var scale:Number = 1/(1-min);

            return function(t:Number):Number {
                if (t < 0.5) {
                    return scale * (Math.pow(base, power * (2*t-1)) - min) * 0.5;
                } else {
                    return scale * (2 - Math.pow(base, power * (2*t-1))) * 0.5;
                }
            }
        }

        /** Back in. */
        public static function backIn():Function {
            return net.flashpunk.utils.Ease.backIn;
        }

        /** Back out. */
        public static function backOut():Function {
            return net.flashpunk.utils.Ease.backOut;
        }

        /** Back in and out. */
        public static function backInOut():Function {
            return net.flashpunk.utils.Ease.backInOut;
        }

        /** Return 1 for all values > 0, then 'fall off a cliff' at 0. */
        public static function cliff():Function {
            return _cliff;
        }

        private static function _cliff(t:Number):Number {
            if (t > 0) {
                return 1;
            } else {
                return 0;
            }
        }

        /** 'Fall into a pit' as soon as the value drops below 1. */
        public static function pit():Function {
            return _pit;
        }

        private static function _pit(t:Number):Number {
            if (t < 1) {
                return 0;
            } else {
                return 1;
            }
        }

        /** Alias the transition, creating a jagged motion or change. */
        public static function alias(levels:int):Function {
            if (levels < 2) {
                levels = 2;
            }
            --levels;

            return function(t:Number):Number {
                return Math.round(t*levels)/levels;
            };
        }
    }
}
