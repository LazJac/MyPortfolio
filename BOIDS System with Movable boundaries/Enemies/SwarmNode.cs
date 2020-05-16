using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class SwarmNode : MonoBehaviour      //Acts as an anchor point for swarms of enemies to follow and Spawns enemies
{
    //Enemy properties
    [SerializeField] private GameObject enemyPrefab;

    [SerializeField] private int amountEnemies;

    [SerializeField] private float neighborRadius;
    [SerializeField] private float avoidanceRadius;
    private float sqrAvoidanceRadius;
    [SerializeField] private GameObject enemyContainer;

    private GameObject[] enemyList;
    private Enemy[] enemyScriptList;

    //SwarmNode properties
    [SerializeField] private Vector3 endPos;
    [SerializeField] private Vector3 lookDirection;
    [SerializeField] private float swarmNodeSpeed;
    [SerializeField] private float swarmBounds;
    private float sqrSwarmBounds;

    [SerializeField] private SwarmBehavior swarmBehavior;


    private NavMeshAgent navMeshAgent;

    private EntityController controller;
    private bool startIter = false; //NB temp


    public void OnDrawGizmos() //NB Testing
    {
        Gizmos.color = Color.cyan;
        Gizmos.DrawWireSphere(transform.position, swarmBounds);
    }

    public void init()
    {
        navMeshAgent = GetComponent<NavMeshAgent>();

        if (enemyPrefab == null || amountEnemies == 0 || neighborRadius == 0 || avoidanceRadius == 0 || enemyContainer == null || swarmBounds == 0)
        {
            Debug.Log("Error in " + this.name + ": One or more parameters have been left empty.");
            UnityEditor.EditorApplication.ExitPlaymode();
        }

        sqrSwarmBounds = swarmBounds * swarmBounds;
        sqrAvoidanceRadius = avoidanceRadius * avoidanceRadius;

        controller = new EntityController(new EntityMovement(navMeshAgent));  //init swarm controls

        if (controller.MoveEntity(endPos, lookDirection, swarmNodeSpeed) == false)  //move swarm-node
        {
            Debug.Log("Error in PlayerController; Tried moving player failed");
            UnityEditor.EditorApplication.ExitPlaymode();
        }

        Spawner();

        startIter = true;
    }

    private GameObject enemy;
    public void Spawner()   //Spawn enemies in and nearby the bounds/limits of the swarm node; and populates 'enemyScriptList[]' with enemy scripts
    {
        enemyList = new GameObject[amountEnemies];
        enemyScriptList = new Enemy[amountEnemies];

        for (int i = 0; i < amountEnemies; ++i)
        {
            enemy = Instantiate(enemyPrefab,
                                new Vector3(Random.Range((-1* swarmBounds), swarmBounds), 0f, Random.Range((-1 * swarmBounds), swarmBounds)),
                                Quaternion.Euler(new Vector3(0f, Random.Range(0f, 360f), 0f)),
                                transform);
            enemy.name = "Enemy " + i;
            
            enemy.transform.parent = enemyContainer.transform;

            enemyScriptList[i] = enemy.GetComponent<Enemy>();
            enemyScriptList[i].init(this);

            enemyList[i] = enemy;
        }
    }

    private List<Transform> context;
    private Vector3 move;
    private void Update()   //NB optimize //Calulate the move of each enemy using a BOIDS system
    {
        if (startIter == true)
        {
            for (int i = 0;i < enemyList.Length;++i)
            {
                context = GetNearbyObjects(enemyList[i]);

                move = swarmBehavior.CalculateMove(enemyScriptList[i], context, this);

                move.y = 0f;

                enemyScriptList[i].MoveEnemy(move);
            }
        }
    }

    private List<Transform> contextNearby;
    private Collider[] contextColliders;
    private List<Transform> GetNearbyObjects(GameObject enemy)      //Populates a list with all neighboring enemies inside the current enemy's 'neighborRadius'.
    {
        contextNearby = new List<Transform>();
        contextColliders = Physics.OverlapSphere(enemy.transform.position, neighborRadius);
        for (int i = 0; i < contextColliders.Length; ++i)
        {
            if (contextColliders[i] != enemy.GetComponent<Enemy>().getCapsuleCollider())
            {
                contextNearby.Add(contextColliders[i].transform);
            }
        }

        return contextNearby;
    }

    public float getSwarmBounds()
    {
        return swarmBounds;
    }

    public float getSqrSwarmBounds()
    {
        return sqrSwarmBounds;
    }

    public float getAvoidanceRadius()
    {
        return avoidanceRadius;
    }

    public float getSqrAvoidanceRadius()
    {
        return sqrAvoidanceRadius;
    }

    public float getNeighborRadius()
    {
        return neighborRadius;
    }
}
