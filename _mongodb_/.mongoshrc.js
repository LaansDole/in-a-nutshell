// Customize the display information on the query input

async function showDatabasesOnStartup() {
    const adminDb = db.getSiblingDB('admin');
    const { databases } = await adminDb.runCommand({ listDatabases: 1 });
    print('Databases:');
    for (const { name } of databases) {
      print(`- ${name}`);
    }
}
  
showDatabasesOnStartup();

let cmdCount = -1;
prompt = function() {
    return "\nUptime:" + db.serverStatus().uptime +
           " Documents:" + db.stats().objects +
           " | Cmd count: " + (cmdCount++) +
           ` | ${db.getName()}> ` ;
    }
