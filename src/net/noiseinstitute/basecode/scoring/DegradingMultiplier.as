package net.noiseinstitute.basecode.scoring {
    import net.flashpunk.Entity;
    import net.noiseinstitute.basecode.Ease;

    public class DegradingMultiplier extends Entity implements IScoreModifier {
        private var _factor:Number = 1;
        private var factorBeforeDegradation:Number = 1;
        private var degradeElapsedFrames:int = 0;
        private var degradeDurationFrames:Number;
        private var easing:Function;

        public function get factor():Number {
            return _factor;
        }

        public function set factor(factor:Number):void {
            _factor = factor;
            factorBeforeDegradation = factor;
            degradeElapsedFrames = 0;
        }

        public function DegradingMultiplier(degradeDurationFrames:Number, easing:Function=null) {
            this.degradeDurationFrames = degradeDurationFrames;
            this.easing = easing || Ease.cliff();
        }

        public function modify (points:Number):Number {
            return points * _factor;
        }

        override public function update():void {
            if (_factor == 1) {
                return;
            }

            if (++degradeElapsedFrames > degradeDurationFrames) {
                _factor = 1;
                return;
            }

            var t:Number = easing((degradeDurationFrames - degradeElapsedFrames) / degradeDurationFrames);
            _factor = factorBeforeDegradation * t;
        }
    }
}
