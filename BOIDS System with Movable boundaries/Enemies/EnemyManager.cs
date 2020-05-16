using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyManager : MonoBehaviour       //Spawns swarm-nodes
{
    [SerializeField] private GameObject[] swarmList;
    private SwarmNode[] swarmListScripts;

    private void Awake()
    {
        int length = swarmList.Length;
        if (length == 0)  
        {
            Debug.Log("Error in EnemyManager; 'swarmList' can't be left empty");
            UnityEditor.EditorApplication.ExitPlaymode();
        }

        swarmListScripts = new SwarmNode[length];

        for (int i = 0;i < length; ++i)
        {
            swarmList[i].SetActive(true);
            swarmListScripts[i] = swarmList[i].GetComponent<SwarmNode>();
            swarmListScripts[i].init();
        }
    }
}
