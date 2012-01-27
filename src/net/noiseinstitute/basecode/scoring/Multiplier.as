package net.noiseinstitute.basecode.scoring {
    public class Multiplier implements IScoreModifier {
        public var factor:Number;

        public function Multiplier (factor:Number=1) {
            this.factor = factor;
        }

        public function modify (points:Number):Number {
            return points * factor;
        }
    }
}
