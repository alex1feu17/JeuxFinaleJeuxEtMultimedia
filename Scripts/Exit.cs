using Godot;
using System;

public class Exit : Button
{

	public override void _Ready()
	{
		
	}
	public override void _Pressed()
	{
		GetTree().ChangeScene("res://Scenes/MainTitleScreen.tscn");
	}


}
