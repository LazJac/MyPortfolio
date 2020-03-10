using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class SampleButton : MonoBehaviour {

	public int buttonNr;
	public Button button;
	public Image buttonImage;
	public Text buttonName;
	public Text buttonSubInfo;
	public StartMenu startMenu;

	public void ClickedButton()
	{
		GameObject menu = GameObject.Find ("Player");
		startMenu = menu.GetComponent<StartMenu>();
		startMenu.setHotbar(this.buttonNr);
		Destroy(button);
	}
}
