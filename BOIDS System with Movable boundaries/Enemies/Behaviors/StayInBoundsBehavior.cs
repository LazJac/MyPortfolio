using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "Swarm/Behavior/StayInBounds")]
public class StayInBoundsBehavior : SwarmBehavior       //Move to the center position of SwarmWave
{
    [Range(0f, 1f)] [SerializeField] float buffer;
    private Vector3 center;
    private float sqrRadius;

    private Vector3 currentVelocity;


    private Vector3 centerOffset;
    private float t;
    public override Vector3 CalculateMove(Enemy enemy, List<Transform> context, SwarmNode swarm)
    {
        center = swarm.transform.position;
        sqrRadius = swarm.getSqrSwarmBounds();

        centerOffset = center - enemy.transform.position;
        if ((centerOffset.sqrMagnitude / sqrRadius) < buffer)
        {
            return Vector3.zero;
        }

        return centerOffset;
    }
}
