using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class Player : MonoBehaviour {

    //WASD - Movement
    //I - Chest oop
    //Q - Player inventory
    //W - Op stairs te gaan
    //E - Down stairs
	//Esc - Menu
	//Backspace - Return/Exit Menu
	
	[Range(10 ,25)]
	public float speed;
	[Range(0 ,50)]
	public float sprint;
	[Range(0, 30)]
	public int jumpHeight;
	
	public Slider healthSlider = null;
	public Image fill = null;
	
	public int doorNrTemp, negative ;
	public static int doorNr, direction = 1;
	public bool moveable = true;


	private int health = 100;
	private float speedTemp ,sprintTemp;
	private bool facingRight = true;
	private Vector2 v2Move;
	private bool jump = false;

	public void playerAwake() //GEROEP deur "Enter"
	{
		StairsPos (1,0);
		GameObject slider = GameObject.Find ("Slider");
		healthSlider = slider.GetComponent<Slider>();
		GameObject imageFill = GameObject.Find ("Fill");
		fill = imageFill.GetComponent<Image>();

		speedTemp = speed;
		sprintTemp = sprint;
		healthSlider.value = health;
		fill.enabled = false;
	}
	
	private void Update()
	{
		if (transform.position.x < 0.1f && negative == 2 && TerrainGen.roomTipe == 0)
		{
			DoorPos(doorNr,negative);
		}
        if (Input.GetKey(KeyCode.Q))
        {
            StartMenu.startMenu.PlayerInventory(false);
        }
	}

	public void DoorPos(int DoorNumber,int Negative)  //1 = seed ; 2 = -seed 
	{
		doorNr = DoorNumber;
		negative = Negative;
		int level = TerrainGen.level - 1;

		if (negative == 1)
		{
			transform.position = SeedGen.levelPos[level ,doorNr - 1]; 
		}
		if (negative == 2)
		{
			transform.position = SeedGen.levelNegPos[level ,doorNr - 1];
		}
	}
	
	public void StairsPos(int Dir,int DoorNumber)   //Vir by trappe plaas; 1 = LEFT  en   2 = RIGHT
	{
		direction = Dir;
		doorNr = DoorNumber;
		doorNrTemp = doorNr;
		doorNr = doorNrTemp;
		
		Vector2 charLeft = new Vector2 (0.5f,0f);
		Vector2 charRight = new Vector2 (0f,0f);
		if (TerrainGen.roomTipe == 0)
		{
			charRight = new Vector2 (TerrainGen.newPos - 0.5f,0f);
		}
		else
		{
			charRight = new Vector2 ((TerrainGen.newPos*2) - 0.5f,0f);
		}
		transform.position = direction == 1 ? charLeft : charRight;
	}
	
	private void FixedUpdate()
	{
		if (moveable) 
		{
			Debug.DrawLine(this.transform.position, new Vector2(this.transform.position.x, this.transform.position.y - 0.11f), Color.green);
			if (Physics2D.Linecast(this.transform.position, new Vector2(this.transform.position.x, this.transform.position.y - 0.11f), 1 << LayerMask.NameToLayer("TerrainLayer")))
			{
				jump = true;
			}
			else
			{
				jump = false;
			}

			float fInput_x = Input.GetAxisRaw("Horizontal");        

			if (Input.GetKey(KeyCode.LeftShift))
				speed = sprintTemp;
			else
				speed = speedTemp;

			if (Input.GetKey(KeyCode.Space) && jump == true)
			{
				v2Move = new Vector2(fInput_x, jumpHeight); //jumpHeigth <---
			}
			else
			{
				v2Move = new Vector2(fInput_x, 0);
			}
			GetComponent<Rigidbody2D>().AddForce(v2Move * speed);

			if (fInput_x > 0 && !facingRight)
				Flip();
			else if (fInput_x < 0 && facingRight)
				Flip();

			transform.rotation = Quaternion.Euler(transform.rotation.eulerAngles.x, 0f, 0f);
		}
	}
	
	private void Flip () 				
	{
		facingRight = !facingRight;
		Vector3 scale = transform.localScale;
		scale.x *= -1;
		transform.localScale = scale;
	}
	
	void OnTriggerStay2D (Collider2D other)
	{
		if (other.tag == "Enemy" && moveable == true) 
		{
			HealthLoss(10);
		}
		//Meer goed wat damage
	}
	
	public void HealthLoss (int damage) //Meer complex
	{
		health -= damage;
		healthSlider.value = health;
		
		//Enemy backstep anim
		
		StartCoroutine (Stun());		
		if (health <= 0)
		{
			Debug.Log("Dead");
			//GameOver
		}
	}
	
	private IEnumerator Stun()
	{
		moveable = false;
		fill.enabled = true;
		//Play animation
		yield return new WaitForSeconds(1f);
		if (health < 30)
		{
			fill.color = Color.red;
			//Dalk sounds ?
		}
		else
		{
			fill.enabled = false;
		}
		moveable = true;
	}

	private IEnumerator Timer(int sec, int typeOfTimer)
	{
		while (!jump)
		{
			yield return new WaitForSeconds(sec);
			yield return null;
		}

	}
}
