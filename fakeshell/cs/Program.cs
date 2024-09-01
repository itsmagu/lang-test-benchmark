using System;
using static System.Console;

// I like the practice of passing methods like
// I did in my Bombshell project, so let's recreate that.
public static class Program
{
    public static void Main(string[] args){
        while (!Shell.quitOnNext){
            Write("\n$>");
            Shell.RunCommand(ReadLine()!);
        }
    }
}

static class Shell
{
    internal static bool quitOnNext = false;
    internal static void RunCommand(string command){ }
}

static class FileSystem
{
    static Folder root = new Folder(null, null);
}

class File
{
    public override string ToString() => "File";
}

class Folder
{
    public Folder(Folder[]? children, File[]? content){
        this.children = children;
        this.content = content;
    }
    public override string ToString() => "Folder";
    public Folder[]? children;
    public File[]? content;
}