dataSource {

    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'org.hibernate.cache.SingletonEhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.SingletonEhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost/rathna_pharma"
            username = "rathna"
            password = "(O!mb@tOre"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost/rathna_pharma"
            username = "rathna"
            password = "(O!mb@tOre"
        }
    }
    production {
            dataSource {
                dbCreate = "update"
                driverClassName = "org.postgresql.Driver"
                dialect = org.hibernate.dialect.PostgreSQLDialect

                uri = new URI(System.env.DATABASE_URL?:"postgres://test:test@localhost/test")

                url = "jdbc:postgresql://" + uri.host + ":" + uri.port + uri.path
                username = uri.userInfo.split(":")[0]
                password = uri.userInfo.split(":")[1]
            }
    }
}
