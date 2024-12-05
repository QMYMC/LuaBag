using System;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

public class LuaCopyEditor : Editor
{
    [MenuItem("XLua/Copy Lua To Txt")]
    public static void CopyLuaToTxt()
    {
        //首先要找到所有Lua文件
        string path = Application.dataPath + "/Lua/";
        if (!Directory.Exists(path))
        {
            return;
        }

        string[] str = Directory.GetFiles(path, "*.lua");

        //然后把Lua文件拷贝到新的文件夹
        string newPath = Application.dataPath + "/LuaTxt/";
        //为了避免被删除的lua文件仍然使用，要先清空目标文件
        if (!Directory.Exists(newPath))
        {
            Directory.CreateDirectory(newPath);
        }
        else
        {
            string[] oldFiles = Directory.GetFiles(newPath, "*.txt");
            foreach (var t in oldFiles)
            {
                File.Delete(t);
            }
        }
        
        
        List<string> newFiles = new List<string>();
        foreach (var t in str)
        {
            var fileName = newPath + t.Substring(t.LastIndexOf('/') + 1) + ".txt";
            File.Copy(t, fileName);
            newFiles.Add(fileName);
            string assetPath = "Assets" + fileName.Substring(Application.dataPath.Length).Replace("\\", "/");
            AssetImporter importer = AssetImporter.GetAtPath(assetPath);
            if (importer != null)
            {
                importer.assetBundleName = "lua";
                AssetDatabase.ImportAsset(assetPath);
            }
        }
        AssetDatabase.Refresh();
    }
}
