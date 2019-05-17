declare module namespace {

    export interface Bookmarks {
        version: number; // = 1
        roots: RootNodes;
    }

    export interface RootNodes {
        bookmark_bar: Node;         // bookmark bar
        other: Node;                // unsorted bookmarks
        synced: Node;               // = { type: "Folder", children: [] }
    }

    export interface Node {
        children?: Node[];          // exists if type = "folder"
        name?: string;              // exists for all except "bookmark_bar", "other", and "synced" props of RootNodes
        type: string;               // "url" | "folder"
        url?: string;               // exists if type = "url"
    }

}
