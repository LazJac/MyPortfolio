
/**
 * Write a description of class RugbyGame here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class RugbyGame extends Game
{
    private Dbl team1score, team2score;
    
    public RugbyGame(String team1name, String team2name)
    {
        super(team1name,team2name);
        team1score = new Dbl(0);
        team2score = new Dbl(0);
    }
    
    public String addScore(String teamName, double Score)
    {
        if (teamName.equals(super.getTeam1Name()))
        {
            double name = team1score.doubleValue();
            name += Score;
            team1score = new Dbl(name);
            return super.getTeam1Name() + Double.toString(name);
        }
        else
        {
            if (teamName.equals(super.getTeam2Name()))
            {
                double name = team2score.doubleValue();
                name += Score;
                team1score = new Dbl(name);
                return super.getTeam2Name() + Double.toString(name);
            }
            else
            {
                return "Invalid Team name";
            }            
        }
    }
}
