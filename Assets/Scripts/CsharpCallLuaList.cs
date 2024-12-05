using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using XLua;

public static class CsharpCallLuaList
{
    [CSharpCallLua] public static List<Type> csharpCallLuaList = new List<Type>();
}