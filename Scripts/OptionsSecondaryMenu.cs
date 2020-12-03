using Godot;
using System;

public class OptionsSecondaryMenu : Button
{

	public override void _Ready()
	{
		
	}
	public override void _Pressed()
	{
		GetTree().ChangeScene("res://Scenes/Options.tscn");
	}


}
