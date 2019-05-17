declare module namespace {

    export interface ChromeBookmarks {
        version: number; // = 1
        roots: RootNode;
    }

    export interface RootNode {
        bookmark_bar: ChromeNode;       // bookmark bar
        other: ChromeNode;              // unsorted bookmarks
        synced: ChromeNode;             // = { type: "Folder", children: [] }
    }

    export interface ChromeNode {
        children?: ChromeNode[];        // exists if type = "folder"
        name?: string;                  // exists for all except "bookmark_bar", "other", and "synced" props of RootNode
        type: string;                   // "url" | "folder"
        url?: string;                   // exists if type = "url"
    }

}
