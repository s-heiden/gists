declare module namespace {

    export interface SafariBookmarks {
        Children: Node[];
        WebBookmarkType: string;
    }

    export interface URIDictionary {
        title: string;
    }

    export interface Node {             
        Children: Node[];               // iff Type = "WebBookmarkTypeList"
        ShouldOmitFromUI?: boolean;     // iff Title = "com.apple.ReadingList"
        Title: string;                  // iff Type = "WebBookmarkTypeList"
        URIDictionary?: URIDictionary;  // iff Type = "WebBookmarkTypeLeaf"
        URLString?: string;             // iff Type = "WebBookmarkTypeLeaf"
        WebBookmarkIdentifier: string;   // iff Type = "WebBookmarkTypeProxy"
        WebBookmarkType: string;        // "WebBookmarkTypeList" | "WebBookmarkTypeLeaf" | "WebBookmarkTypeProxy"
    }


}

