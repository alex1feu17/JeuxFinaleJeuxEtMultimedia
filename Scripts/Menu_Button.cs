using Godot;
using System;

public class Menu_Button : Button
{
	

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
	}
	public override void _Pressed()
	{
		GetTree().ChangeScene("res://Scenes/SecondaryScreen.tscn");
	}

  // Called every frame. 'delta' is the elapsed time since the previous frame.
	 
}
