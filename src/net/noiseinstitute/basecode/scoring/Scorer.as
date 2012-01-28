package net.noiseinstitute.basecode.scoring {
    import flash.errors.IllegalOperationError;
    import flash.utils.Dictionary;

    public class Scorer {
        private var _score:Number;
        private var modifiers:Vector.<IScoreModifier> = new <IScoreModifier>[];
        private var scoreListeners:Vector.<Function> = new <Function>[];
        private var childScorers:Dictionary = new Dictionary();

        public function get score():Number {
            return _score;
        }

        public function scorePoint():void {
            scorePoints(1);
        }

        public function scorePoints(points:Number, scoreEvent:IScoreEvent=null):void {
            if (!isFinite(points)) {
                throw new ArgumentError("points is not a finite number");
            }

            for each (var modifier:IScoreModifier in modifiers) {
                points = modifier.modify(points);
            }

            for each (var listener:Function in scoreListeners) {
                listener(points, scoreEvent);
            }

            _score += points;
        }

        public function addModifier(modifier:IScoreModifier):void {
            if (modifier == null) {
                throw new ArgumentError("modifier is null");
            }

            modifiers[modifiers.length] = modifier;
        }

        public function removeModifier(modifier:IScoreModifier):void {
            if (modifier == null) {
                throw new ArgumentError("modifier is null");
            }

            var i:int = modifiers.indexOf(modifier);
            if (i >= 0) {
                modifiers.splice(i, 1);
            } else {
                throw new IllegalOperationError("Tried to remove a modifier that was never added");
            }
        }

        public function addScoreListener(listener:Function):Function {
            if (listener == null) {
                throw new ArgumentError("listener is null");
            }

            scoreListeners[scoreListeners.length] = listener;
            return listener;
        }

        public function removeScoreListener(listener:Function):void {
            if (listener == null) {
                throw new ArgumentError("listener is null");
            }

            var i:int = scoreListeners.indexOf(listener);
            if (i >= 0) {
                scoreListeners.splice(i, 1);
            } else {
                throw new IllegalOperationError("Tried to remove a score listener that was never added");
            }
        }

        public function addChild(scorer:Scorer):void {
            if (scorer == null) {
                throw new ArgumentError("scorer is null");
            }

            if (childScorers[scorer] == null) {
                childScorers[scorer] = 1;
            } else {
                ++childScorers[scorer];
            }

            scorer.addScoreListener(scorePoints);
        }

        public function removeChild(scorer:Scorer):void {
            if (scorer == null) {
                throw new ArgumentError("scorer is null");
            }

            if (childScorers[scorer] > 0) {
                if (childScorers[scorer] == 1) {
                    delete childScorers[scorer];
                } else {
                    --childScorers[scorer];
                }

                scorer.removeScoreListener(scorePoints);
            } else {
                throw new IllegalOperationError("Tried to remove a child scorer that was never added");
            }
        }
    }
}
