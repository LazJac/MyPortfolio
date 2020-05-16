using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Enemy : MonoBehaviour      //Move entity according to behaviors
{
    private CapsuleCollider enemyCapsuleCollider;
    private SwarmNode swarmNode;

    [SerializeField] private float enemySpeed;
    [SerializeField] private float maxSpeed;
    [Range(0f, 1f)] [SerializeField] private float movementSmoothTime;

    private float sprMaxSpeed;


    public void OnDrawGizmos() //NB Testing
    {
        if (swarmNode != null)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(transform.position, swarmNode.getNeighborRadius());

            Color col = Color.blue;
            Gizmos.color = col;
            Gizmos.DrawWireSphere(transform.position, swarmNode.getAvoidanceRadius());
        }
    }

    private void Awake()
    {
        enemyCapsuleCollider = GetComponent<CapsuleCollider>();

        sprMaxSpeed = maxSpeed * maxSpeed;
    }

    public void init(SwarmNode swarmNode)
    {
        this.swarmNode = swarmNode;
    }

    public CapsuleCollider getCapsuleCollider()      
    {
        return enemyCapsuleCollider;
    }

    private Vector3 distance;
    private Vector3 currentVelocity;
    public void MoveEnemy(Vector3 velocity)        //Move function
    {
        if (velocity == Vector3.zero)
        {
            return;
        }

        distance = velocity * enemySpeed;
        if (distance.sqrMagnitude > sprMaxSpeed)
        {
            distance = distance.normalized * maxSpeed;
        }

        Vector3 temp = Vector3.SmoothDamp(transform.forward, velocity, ref currentVelocity, movementSmoothTime);    //Used here to remove jittering made by behaviors making sudden movements

        transform.forward = temp;
        transform.position += distance * Time.deltaTime;
    }

}
