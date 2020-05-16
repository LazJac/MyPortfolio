using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "Swarm/Behavior/Avoidance")]
public class AvoidanceBehavior : SwarmBehavior      //Move to a position a set distance away for neighbors
{
    private int contextCount;
    private Vector3 avoidanceMove;
    public override Vector3 CalculateMove(Enemy enemy, List<Transform> context, SwarmNode swarm)
    {
        contextCount = context.Count;
        if (contextCount == 0)
        {
            return Vector3.zero;
        }

        avoidanceMove = Vector3.zero;
        int nAvoid = 0;
        for (int i = 0;i < contextCount; ++i)
        {
            if (Vector3.SqrMagnitude(context[i].position - enemy.transform.position) < swarm.getSqrAvoidanceRadius()) 
            {
                ++nAvoid;
                avoidanceMove += (enemy.transform.position - context[i].position);
            }
        }

        if (nAvoid > 0)
        {
            avoidanceMove /= nAvoid;
        }

        return avoidanceMove;
    }
}
