package net.noiseinstitute.basecode.scoring {
    public interface IScoreModifier {
        function modify(points:Number):Number;
        function update():void;
    }
}
