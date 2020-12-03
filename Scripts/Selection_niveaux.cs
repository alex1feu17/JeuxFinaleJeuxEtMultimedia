using Godot;
using System;

public class Selection_niveaux : Button
{

	public override void _Ready()
	{
		
	}
	public override void _Pressed()
	{
		GetTree().ChangeScene("res://Scenes/Map.tscn");
	}

}
