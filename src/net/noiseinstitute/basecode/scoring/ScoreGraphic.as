package net.noiseinstitute.basecode.scoring {
    import flash.display.BitmapData;
    import flash.geom.Point;

    import net.flashpunk.Graphic;
    import net.flashpunk.graphics.Text;
    import net.noiseinstitute.basecode.formatters.DefaultNumberFormatter;
    import net.noiseinstitute.basecode.formatters.INumberFormatter;

    public class ScoreGraphic extends Graphic {
        public var scorer:Scorer;
        public var text:Text = new Text("");

        private var _numberFormatter:INumberFormatter;
        private var _prefix:String = "";
        private var _postfix:String = "";

        public function get numberFormatter():INumberFormatter {
            return _numberFormatter;
        }

        public function set numberFormatter(numberFormatter:INumberFormatter):void {
            _numberFormatter = numberFormatter || DefaultNumberFormatter.instance;
        }

        public function get prefix():String {
            return _prefix;
        }

        public function set prefix(prefix:String):void {
            _prefix = prefix || "";
        }

        public function get postfix():String {
            return _postfix;
        }

        public function set postfix(postfix:String):void {
            _postfix = postfix || "";
        }

        public function ScoreGraphic (scorer:Scorer, numberFormatter:INumberFormatter=null) {
            this.scorer = scorer;
            _numberFormatter = numberFormatter || DefaultNumberFormatter.instance;
            this.text = text;
        }

        override public function render(target:BitmapData, point:Point, camera:Point):void {
            if (text == null || scorer == null) {
                return;
            }

            text.text = _prefix + scorer.score.toString() + _postfix;
            text.render(target, point, camera);
        }
    }
}
