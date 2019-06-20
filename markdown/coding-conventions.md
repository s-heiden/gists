# Coding conventions

## Signifying To Do's in code

>```
>   // TODO can both be combined?
>   //   - check if ids$ and isRemovable$ can be combined
>   //   - another multiline TODO part
>   this.ids$ = this.store.select(fromStore.getIds);
>   this.isRemovable$ = this.store
>     .select(fromStore.getIds)
>     .pipe(map(value => value.length > 1));
>   // END TODO
>```

First used in `kursunterstuetzung` implemented by iteratec GmbH, this convention is supported by Intellij and Code.
