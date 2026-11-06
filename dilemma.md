<space>+letter is faster than just typing the letters, for any letter after 'e'.
we have 10 letters that are the fastest to type ('before 'e''):
    - j, k, l, f, d, s, ;, a, i, e,

    we then have the rest of the letters, which take longer to type than <space>+letter;
    o,      w,      u,      n,      r,      v,      m,      h,      p,      g,      t,      <comma>, .,      y,      c,      b,      x,      ',      /,      ,z,     -,      q,#,    [,],    9,      3,      8,      4,      0,      2,      7,      5,      6,      1,      =,      `,      \,      

    <space> is essentially a leader key

currently, each of the 10 fastest keys does an action (e.g. delete word)



    our aim is to make things as fast as possible.

    so at the moment, we have the current order:

    j,        k,        l,        f,        d,        s,        ;,        a,        i,        e,        <space>, k <space>, j <space>, l <space>, d <space>, f <space>, s <space>, ; <space>, a <space>i, <space>e, o,        w,        u,        n,        r,        v,        m,        h,        p,        g,        t,        <comma>,  .,        y,        c,        b,        x,        ',        /,        ,z,       -,        q,#,      [,],      9,        3,        8,        4,        0,        2,        7,        5,        6,        1,        =,        `,        \,        

    Here's the dilemma:
    - do we make any of the 10 fastest-to-type letters leader keys?
    if we did, it would have to be a leader at say the left side, and then a following key at the right.
    or, a leader at the right side, followed by a key at the left.

    i.e.
    aj,ak,al, etc. (where 'a' is the leader)... 
    or 
    ja,js,jd, etc. (where 'j' is the leader)...


    lets say that typibg one of the 10 fast keys, takes 1 unit of time.
    typing a leader + one of the 10 fast keys (i.e. <space>+fast key, as we do now.. or <fast-key-as-leader>+opposite-hand-fast-key, as proposed)... takes 1.2 units of time
typing the other letters go from 1.5 units, all the way down to 5 units... (approximately linearly...)


    the usage of the letters will be an exponential relationship; starting high with 'j', then tailing off..
    (i.e. the fastest combos get a bigger share of the usage)...

    total time is of course sum(usage * units) for all entries.


    so the question:
    - do we assign any of the fast keys as leaders, and have up to 5 combos with the opposite hand?
    - and it we do, how many as leaders?
