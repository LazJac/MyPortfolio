using UnityEngine;
using System.Collections;

public class EnemyControl : MonoBehaviour {
	
	public float walkingSpeed = 0;
	public float runningSpeed = 10;

	public bool moveability;                                                  	
	public float walkDistance;


	private float tempWD, speed;
	private Vector2 moveTemp, move, tempX, walkDist;
	private bool visionExit = true, hunt = false, facingRight = true;

	private void Start()
	{   
		visionExit = true;
		speed = walkingSpeed;
		tempWD = walkDistance;
		tempX = new Vector2 (transform.position.x ,0f);
		move = new Vector2 (1,0.0f);
		walkDist = new Vector2 (tempX.x + walkDistance ,0f);
	}

	private void FixedUpdate()
	{
		if (moveability)
		{
			moveTemp = move;

			GetComponent<Rigidbody2D>().AddForce(move * speed);
			if (transform.position.x > walkDist.x + 1)
			{
				move = new Vector2(-1, 0.0f); //-1 die spasie wat die enemy verby hardloop as hy by jou is {0 ===>}
				walkDistance = 0;
			}
			else
			{
				if (transform.position.x < walkDist.x - 1) //-1 die spasie wat die enemy verby hardloop as hy by jou is {<=== 0}
				{
					move = new Vector2(1, 0.0f);
					walkDistance = tempWD;
				}
			}
			if (!hunt)
			{
				walkDist = new Vector2(tempX.x + walkDistance, 0f);
			}
			else
			{
				float temp = GameObject.FindGameObjectWithTag("Player").transform.position.x;
				walkDist = new Vector2(temp, 0f);
			}
			if (moveTemp != move)
				transform.Rotate(new Vector3(0, 180, 0));
		}

		Debug.DrawLine(new Vector2(transform.position.x + 1.0f, transform.position.y), transform.position, Color.red);

		if (Physics2D.Linecast(new Vector2(walkDist.x + 1.0f, walkDist.y), walkDist, 1 << LayerMask.NameToLayer("CollisionLayer"))) 
		{
			visionExit = false;
			hunt = true;
			StartCoroutine(Timer(3));  //Hurt na uit vision
		}

		if (move.x > 0 && !facingRight)
			Flip();
		else if (move.x < 0 && facingRight)
			Flip();

		transform.rotation = Quaternion.Euler(transform.rotation.eulerAngles.x, 0f, 0f);
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
		if (other.tag == "Player")  //and not hiding 
		{
			visionExit = false;
			hunt = true;
			StartCoroutine(Timer(3));  //Hurt na uit vision
		}
	}

	void OnTriggerExit2D (Collider2D other)
	{
		visionExit = true;
	}

	private IEnumerator Timer (int sec)
	{
		while (!visionExit) 
		{
			Debug.DrawLine(new Vector2(transform.position.x + 1.0f, transform.position.y), transform.position, Color.red);

			speed = runningSpeed;
			yield return null;
		}
		yield return new WaitForSeconds (sec);
		hunt = false;
		speed = walkingSpeed;
	}
}
