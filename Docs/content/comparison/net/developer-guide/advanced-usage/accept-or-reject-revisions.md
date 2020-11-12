---
id: accept-or-reject-revisions
url: comparison/net/accept-or-reject-revisions
title: Accept or Reject revisions 
weight: 4
description: "Following this guide, you will learn how to apply or discard revisions found during document comparison using built-in Microsoft Word functionality."
keywords: Revision, revision processing, accept or reject revision, apply change for revision
productName: GroupDocs.Comparison for .NET
hideChildren: False
---
**[GroupDocs.Comparison](https://products.groupdocs.com/comparison/net)** provides the ability to get revisions from a Docx file format, process and save the processing result.
Below are the steps to *take* revisions from a document, *accept / reject* revisions, and *write* the processing result to a final file.

*   Instantiate **RevisionHandler** object with source document path or stream;
*   Call **GetRevisions** method and obtain detected revision list;
*   Set **Action** of needed change object to **RevisionAction.Accept** or **RevisionAction.Reject** value;
*   Call the **ApplyRevisionChanges** method and pass it: the path or stream of the result document, collection of changes in revisions.

**ApplyRevisionOptions** class:
*   **Changes** - List of revision changes that need to be applied to the final document.

If you do not pass the path or file to the resulting document to the **ApplyRevisionChanges** method, the changes will be written to the same file from which the revisions were taken.

The following code example demonstrates how to get revisions from a document, accept / reject detected revisions and save changes to the resulting document.

## Accept or Reject revisions from local disk

```csharp
using (RevisionHandler revisionHandler = new RevisionHandler(pathRevision + "Document_with_revision.docx"))
{
    List<RevisionInfo> revisionList = revisionHandler.GetRevisions();
    foreach (RevisionInfo revision in revisionList)
    {
        if (revision.Type == RevisionType.Insertion) revision.Action = RevisionAction.Accept;
    }
    revisionHandler.ApplyRevisionChanges(pathRevision + "result.docx", new ApplyRevisionOptions() { Changes = revisionList });
}
```

## Accept or Reject revisions from stream

```csharp
using (RevisionHandler revisionHandler = new RevisionHandler(File.OpenRead("Document_with_revision.docx")))
{
    List<RevisionInfo> revisionList = revisionHandler.GetRevisions();
    foreach (RevisionInfo revision in revisionList)
    {
        if (revision.Type == RevisionType.Insertion) revision.Action = RevisionAction.Accept;
    }
    revisionHandler.ApplyRevisionChanges(pathRevision + "result.docx", new ApplyRevisionOptions() { Changes = revisionList });
}
```

## Result of revision processing
Below are the source and output files based on the code presented earlier.

| Source file | Result  file |
| --- | --- |
| ![](comparison/net/images/revision-file.png) | ![](comparison/net/images/result-revision-file.png) |

## More resources
### GitHub Examples
You may easily run the code above and see the feature in action in our GitHub examples:
*   [GroupDocs.Comparison for .NET examples, plugins, and showcase](https://github.com/groupdocs-comparison/GroupDocs.Comparison-for-.NET)
*   [GroupDocs.Comparison for Java examples, plugins, and showcase](https://github.com/groupdocs-comparison/GroupDocs.Comparison-for-Java)
*   [Document Comparison for .NET MVC UI Example](https://github.com/groupdocs-comparison/GroupDocs.Comparison-for-.NET-MVC)
*   [Document Comparison for .NET App WebForms UI Modern Example](https://github.com/groupdocs-comparison/GroupDocs.Comparison-for-.NET-WebForms)
*   [Document Comparison for Java App Dropwizard UI Modern Example](https://github.com/groupdocs-comparison/GroupDocs.Comparison-for-Java-Dropwizard)
*   [Document Comparison for Java Spring UI Example](https://github.com/groupdocs-comparison/GroupDocs.Comparison-for-Java-Spring)
    
### Free Online App
Along with full-featured .NET library we provide simple, but powerful free Apps.  
You are welcome to compare your DOC or DOCX, XLS or XLSX, PPT or PPTX, PDF, EML, EMLX, MSG and other documents with free to use online [GroupDocs Comparison App](https://products.groupdocs.app/comparison).