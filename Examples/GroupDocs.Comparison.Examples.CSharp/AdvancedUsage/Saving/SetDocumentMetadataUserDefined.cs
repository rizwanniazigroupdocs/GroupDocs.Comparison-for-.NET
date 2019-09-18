﻿using GroupDocs.Comparison.Options;
using System;
using System.IO;

namespace GroupDocs.Comparison.Examples.CSharp.AdvancedUsage
{
    /// <summary>
    /// This example demonstrates using option for select user metadata
    /// </summary>
    class SetDocumentMetadataUserDefined
    {
        public static void Run()
        {
            using (Comparer comparer = new Comparer(Constants.SOURCE_WORD))
            {
                comparer.Add(Constants.TARGET_WORD);
                SaveOptions saveOptions = new SaveOptions()
                {
                    CloneMetadataType = MetadataType.FileAuthor,
                    FileAuthorMetadata = new FileAuthorMetadata
                    {
                        Author = "Tom",
                        Company = "GroupDocs",
                        LastSaveBy = "Jack"
                    }
                };
                comparer.Compare(Constants.RESULT_WORD, saveOptions);
            }
            Console.WriteLine($"\nDocuments compared successfully.\nCheck output in {Directory.GetCurrentDirectory()}.");
        }
    }
}
