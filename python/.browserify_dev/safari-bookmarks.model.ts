declare module namespace {

    export interface SafariBookmarks {
        Children: SafariNode[];
        WebBookmarkType: string;
    }

    export interface URIDictionary {
        title: string;
    }

    export interface SafariNode {
        ShouldOmitFromUI?: boolean;     // iff Title = "com.apple.ReadingList"
        WebBookmarkIdentifier: string;   // iff Type = "WebBookmarkTypeProxy"
        URIDictionary?: URIDictionary;  // iff Type = "WebBookmarkTypeLeaf"
        URLString?: string;             // iff Type = "WebBookmarkTypeLeaf"      
        Children: SafariNode[];               // iff Type = "WebBookmarkTypeList"
        Title: string;                  // iff Type = "WebBookmarkTypeList"

        WebBookmarkType: string;        // "WebBookmarkTypeList" | "WebBookmarkTypeLeaf" | "WebBookmarkTypeProxy"
    }


}

