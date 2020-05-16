using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "Swarm/Behavior/Cohesion")]
public class CohesionBehavior : SwarmBehavior       //Move to the average position of neighbors
{
    [SerializeField] private float movementSmoothTime;
    private Vector3 currentVelocity;


    private Vector3 cohesionMove;
    private int contextCount;
    public override Vector3 CalculateMove(Enemy enemy, List<Transform> context, SwarmNode swarm)
    {
        contextCount = context.Count;
        if (contextCount == 0)
        {
            return Vector3.zero;
        }

        cohesionMove = Vector3.zero;
        for (int i = 0;i < contextCount; ++i)
        {
            cohesionMove += context[i].position;
        }
        cohesionMove /= contextCount;

        cohesionMove -= enemy.transform.position;
        cohesionMove = Vector3.SmoothDamp(enemy.transform.forward, cohesionMove, ref currentVelocity, movementSmoothTime);

        return cohesionMove;
    }
}
