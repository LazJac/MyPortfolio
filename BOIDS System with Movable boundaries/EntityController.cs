using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EntityController
{
    private readonly IMoveable entityMovement;
    private Vector3 currentPos;


    public EntityController(EntityMovement entityMovement)
    {
        this.entityMovement = entityMovement;
    }

    public bool MoveEntity(Vector3 v3End, Vector3 lookDirection, float speed)       //Work with all aspects of entity movement
    {
        if (speed > 0f)
        {
            return entityMovement.Move(v3End, lookDirection, speed);        //using EntityMovement.cs to move entity using nav
        }
        else
        {
            Debug.Log("Entity speed can not be set to 0 or less");
            return false;
        }
    }
}
