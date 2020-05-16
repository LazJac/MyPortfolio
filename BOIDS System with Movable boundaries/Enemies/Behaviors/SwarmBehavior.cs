using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class SwarmBehavior : ScriptableObject
{
    public abstract Vector3 CalculateMove(Enemy enemy, List<Transform> context, SwarmNode swarm);
}
