using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "Swarm/Behavior/Composite")]
public class CompositeBehavior : SwarmBehavior      //Run throw all given behaviors and calculates the importants/strenght of a behavior using a weight system
{
    [SerializeField] private SwarmBehavior[] behaviors;
    [SerializeField] private float[] weights;
    private float[] sqrWeights;


    private Vector3 movement;
    private int behaviorLength;


    private Vector3 partialMovement;
    public override Vector3 CalculateMove(Enemy enemy, List<Transform> context, SwarmNode swarm)
    {
        behaviorLength = weights.Length;
        if (behaviorLength != behaviors.Length || behaviorLength == 0)
        {
            Debug.Log("Data mismatch in " + name + ";Somethings are missing in ether 'behaviors' or 'weights'.");
            UnityEditor.EditorApplication.ExitPlaymode();
        }

        movement = Vector3.zero;

        if (sqrWeights.Length == behaviorLength)    //populate the sqaure of all weights before running
        {
            for (int i = 0; i < behaviorLength; ++i)
            {
                partialMovement = behaviors[i].CalculateMove(enemy, context, swarm) * weights[i];

                if (partialMovement != Vector3.zero)
                {
                    if (partialMovement.sqrMagnitude > sqrWeights[i])
                    {
                        partialMovement.Normalize();
                        partialMovement *= weights[i];
                    }

                    movement += partialMovement;
                }
            }
        }
        else
        {
            sqrWeights = new float[behaviorLength];
            for (int i = 0; i < behaviorLength; ++i)
            {
                sqrWeights[i] = weights[i] * weights[i];
            }
        }
        
        return movement;
    }
}
