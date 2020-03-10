
/**
 * Write a description of class SwimmingGame here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class SwimmingGame extends Game
{
    private Comparable timer;
    
    public SwimmingGame()
    {
        super();
    }
    
    public String setTimer(String teamName, double time)
    {
        timer = time;
        if (teamName.equals(super.getTeam1Name()))
        {
            return super.getTeam1Name() + Double.toString(time);
        }
        else
        {
            if (teamName.equals(super.getTeam2Name()))
            {
                return super.getTeam2Name() + Double.toString(time);
            }
            else
            {
                return "Invalid Team name";
            }
        }
    }
    
    @Override
    public String getWinner()
    {
        if (timer.isLE(super.getScoreTeam1()))
        {
            if (team1score.isEQ(super.getScoreTeam2()))
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
}
