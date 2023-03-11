trigger Challenge2 on Contact (before insert) {
    for(Contact cont : Trigger.new) {
        if(cont.Email == null || cont.Email.trim() == '') {
            cont.Email = 'example@example.com';
        }
    }
}
