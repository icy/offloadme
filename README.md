## Download learning resources and use them later

Mobile data is too expensive. Kind of `€10 - 15` for 5GB? Well, if you
don't mind people collecting [Pfand bottles for their dinner](https://en.wikipedia.org/wiki/Container-deposit_legislation#Germany).

### voa.english

Requirements:

    $ grep require lib/voa.english.sh
    : require bash4 lynx ruby wget linux

Examples

    # Download lession 2
    $ ./lib/voa-english.sh self.test \
        https://learningenglish.voanews.com/a/lets-learn-english-level-2-lesson1/3960391.html

    # <snip>

    $ ./lib/voa.english.sh self.test https://learningenglish.voanews.com/a/lets-learn-english-lesson-22/3397314.html
    :: Writting new file output/voa.english/lets-learn-english-lesson-22/new_words.txt
    :: Writting new file output/voa.english/lets-learn-english-lesson-22/for_teachers.txt
    :: Writting new file output/voa.english/lets-learn-english-lesson-22/conversation.txt
    :: Writting new file output/voa.english/lets-learn-english-lesson-22/links.txt
    --2019-02-20 04:59:19--  https://av.voanews.com/Videoroot/Pangeavideo/2016/07/5/5b/5b9f15c6-1999-4264-a270-a43c6b5dc9bb.mp4
    Loaded CA certificate '/etc/ssl/certs/ca-certificates.crt'
    Resolving av.voanews.com (av.voanews.com)... 23.38.13.53, 2a02:26f0:2d:1b2::131b, 2a02:26f0:2d:193::131b, ...
    Connecting to av.voanews.com (av.voanews.com)|23.38.13.53|:443... connected.
    HTTP request sent, awaiting response... 416 Requested Range Not Satisfiable

        The file is already fully retrieved; nothing to do.

    --2019-02-20 04:59:20--  https://av.voanews.com/Videoroot/Pangeavideo/2016/07/5/5b/5b9f15c6-1999-4264-a270-a43c6b5dc9bb_hq.mp4
    Reusing existing connection to av.voanews.com:443.
    HTTP request sent, awaiting response... 416 Requested Range Not Satisfiable

        The file is already fully retrieved; nothing to do.
