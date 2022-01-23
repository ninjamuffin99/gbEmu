import haxe.io.Bytes;
using StringTools;

class Z80
{

    static var programCounter:Int;
    public static var romBytes:Bytes;

    static function nop()
    {
        trace('NOP');
        // huh
    }

    static function jp(nn1:Int, nn2:Int)
    {
        trace("JP");
        trace(nn1.hex());
        programCounter = nn2;
        trace(nn2.hex());
    }

    static var opPos:Int;

    public static function readOpCode(byteShit:Int)
    {
        opPos = romBytes.get(byteShit);
        trace("OP CODE: " + opPos.hex());

        switch (opPos)
        {
            case 0x00:
                nop();
            case 0xC3:
                jp(romBytes.get(byteShit + 1), romBytes.get(byteShit + 2));
            default:
                trace('NO OP CODE FOR: ' + opPos.hex());
        }
    }
}