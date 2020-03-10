
/**
 * Write a description of class Game here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Game implements Sport
{
    private String team1, team2;
    private Comparable team1score, team2score;
      
    public Game(String team1name, String team2name)
    {
        team1 = team1name;
        team2 = team2name;
    }
    
    public Game()
    {
        team1 = "Team1";
        team2 = "Team2";
    }
    
    public String getScoreTeam1()
    {
        return null;
    }
    
    public String getScoreTeam2()
    {
        return null;
    }
    
    public String getWinner()
    {
        if (team1score.isGE(team2score))
        {
            if (team1score.isEQ(team2score))
            {
                return "Scores are level";
            }
            return team1;
        }
        else
        {
            return team2;
        }
    }
    
    public String getTeam1Name()
    {
        return team1;
    }
    
    public String getTeam2Name()
    {
        return team2;
    }
}














