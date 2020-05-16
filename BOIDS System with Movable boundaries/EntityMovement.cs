using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public interface IMoveable
{
    bool Move(Vector3 v3End, Vector3 direction, float speed);
}

public class EntityMovement : IMoveable     //Work with aspects of entity movement, ie. walking, running, stunned, waiting, etc.
{
    private NavMeshAgent navMeshAgent;
    private Vector3 lookDirection;

    public EntityMovement(NavMeshAgent navMeshAgent)
    {
        this.navMeshAgent = navMeshAgent;
    }

    public bool Move(Vector3 v3End, Vector3 lookDirection, float speed)     //Moves a given gameobject using nav
    {
        if (LevelManager.movementEnabled == false)
        {
            return false;
        }

        this.lookDirection = lookDirection.normalized; //NB uses later

        navMeshAgent.speed = speed;

        navMeshAgent.isStopped = true;
        navMeshAgent.SetDestination(v3End);     
        navMeshAgent.isStopped = false;

        return true;
    }
}
