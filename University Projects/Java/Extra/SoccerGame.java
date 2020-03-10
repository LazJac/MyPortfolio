
/**
 * Write a description of class SoccerGame here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class SoccerGame extends Game
{
    private Int team1score, team2score;
    
    public SoccerGame(String team1name, String team2name)
    {        
        super(team1name,team2name);
        team1score = new Int(0);
        team2score = new Int(0);
    }
    
    public String addScore(String teamName)
    {
        if (teamName.equals(super.getTeam1Name()))
        {
            int name = team1score.intValue();
            ++name;
            team1score = new Int(name);
            return super.getTeam1Name() + Integer.toString(name);
        }
        else
        {
            if (teamName.equals(super.getTeam2Name()))
            {
                int name = team2score.intValue();
                ++name;
                team1score = new Int(name);
                return super.getTeam2Name() + Integer.toString(name);
            }
            else
            {
                return "Invalid Team name";
            }            
        }
    }
}
