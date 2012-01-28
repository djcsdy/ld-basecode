package net.noiseinstitute.basecode.scoring {
    import flash.display.BitmapData;
    import flash.geom.Point;

    import net.flashpunk.Graphic;
    import net.flashpunk.graphics.Text;

    public class ScoreGraphic extends Graphic {
        public var scorer:Scorer;
        public var text:Text = new Text("");

        public function ScoreGraphic (scorer:Scorer=null) {
            this.scorer = scorer;
            this.text = text;
        }

        override public function render(target:BitmapData, point:Point, camera:Point):void {
            if (text == null || scorer == null) {
                return;
            }

            text.text = scorer.score.toString();
            text.render(target, point, camera);
        }
    }
}
