ID operation tool (idot)
------------------------
Collections of my frequently used ID manipulation scripts in bioinformatic works.

idot
----
```
idot <command> [<arguments>]

Command:  find     find id_file matched lines in target_file
          diff     find specific lines in id_file or target_file
          replace  replace id in the target_file according to the id_file
          fasta    fetch id_file match fasta sequences from all sequences
```


idot find
---------
```
idot find [options] <id_file> <target_file>

Options:  -d  STR  The delimiter character of fields, default <TAB>.
                   Valid delimiters: comma (","), space ("\s"), or <TAB> ("\t")
          -f  INT  The field(s) that specified as ID column(s), default 1.
                   Use comma (",") to specify multiple fields. e.g. -f 1,2
          -s  STR  The method used for ID sort.  default: u.
                   Available methods: sn - strint number
                                      s  - string
                                      n  - number
                                      u  - unsorted (use id_file id order)
                                      t  - use target_file id order
                                      r  - reverse (in combination with others)
          -h       Help message
```

idot diff
---------
```
idot diff [options] <id_file> <target_file>

Options:  -d  STR  The delimiter character of fields, default <TAB>.
                   Valid delimiters: comma (","), space ("\s"), or <TAB> ("\t")
          -f  INT  The field(s) that specified as ID column(s), default 1.
                   Use comma (",") to specify multiple fields. e.g. -f 1,2
          -p  INT  Print the specific ID of file: 1 - id_file (default)
                                                  2 - target_file
          -h       Help message
```

idot replace
------------
```
idot replace <id_file> <target_file>
```

idot fasta
----------
```
idot fasta <id_file> <database_file>
```

Author
------
Qinhu Wang (wangqinhu@nwafu.edu.cn)

Copyright
---------
2017 (c) Qinhu Wang, Northwest A&F University

License
-------
MIT
