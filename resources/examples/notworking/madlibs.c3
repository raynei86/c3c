module madlibs;
import regex, stdio;

fn void main()
{
    printn("Enter a story template, terminated by an empty line:");
    VarString story = "";
    while (1)
    {
        VarString line = stdin.readln().strip() else break;
        story = story.append(line);
        story = story.append("\n");
    }

    Regex r;

    r.initWithOptions("<.+?>", RegexOpt.GLOBAL) else unreachable;
    defer r.destroy();

    foreach (RegexMatch* match : r.match(story))
    {
        VarString s = match.string;
        printf("Enter a value for '%s': ", s[1..^2]);
        string word = stdin.readln().strip() else return;
        story = story.replace(s, word);
    }

    printn("\nThe story becomes:\n%s\n", story);
}