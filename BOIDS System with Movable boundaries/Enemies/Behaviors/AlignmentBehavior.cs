using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "Swarm/Behavior/Alignment")]
public class AlignmentBehavior : SwarmBehavior      //Update to the average direction of neighbors
{
    private Vector3 currentVelocity;


    private int contextCount;
    private Vector3 alignmentMove;
    public override Vector3 CalculateMove(Enemy enemy, List<Transform> context, SwarmNode swarm)
    {
        contextCount = context.Count;
        if (contextCount == 0)
        {
            return enemy.transform.forward;
        } 

        alignmentMove = Vector3.zero;
        for (int i = 0;i < contextCount; ++i)
        {
            alignmentMove += context[i].transform.forward;
        }
        alignmentMove /= contextCount;

        return alignmentMove;
    }
}
