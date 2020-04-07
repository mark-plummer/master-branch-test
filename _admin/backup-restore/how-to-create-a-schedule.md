---
title: [Understand backup/snapshot schedules]

last_updated: 3/10/2020
summary: "Learn about backup and snapshot schedules."
sidebar: mydoc_sidebar
permalink: /:collection/:path.html
---
You can schedule periodic snapshots and backups. ThoughtSpot comes configured with a default periodic snapshot policy. For backups, there is no such policy. You may want to configure one or several of your own backup policies. This section helps you understand existing schedules and how to configure new schedules.

## Configuration format

ThoughtSpot uses a [protocol buffer](https://developers.google.com/protocol-buffers/){:target="_blank"} configuration file to hold snapshot and backup policies. There are slight differences between the configuration of snapshots and backups. Refer to [work with snapshots]({{ site.baseurl }}/admin/backup-restore/overview-snapshot.html) and [configure periodic backups]({{ site.baseurl }}/admin/backup-restore/configure-backup.html). However, the file format defines a `schedule` structure, which is the same for both snapshots and backups. The following example shows the `schedule` format:

```
schedule {
    period {
        number: integer
        unit: MINUTE | HOUR | DAY
        }
    retention_policy {
        bucket {
            time {
                number: integer
                unit: MINUTE | HOUR | DAY
             }
             capacity: integer
        }
    }
    offset_minutes_from_sunday_midnight: integer
}
```

The `schedule` has the following components:

| `period` | Specifies the frequency in the chosen `unit`. You can specify the `unit` as `MINUTE`, `HOUR`, or `DAY`.|
| `retention_policy` | Specifies retention intervals. Retention is on a first-in-first-out (FIFO) basis. So, the system discards the oldest result. You can specify the `unit` as `MINUTE`, `HOUR`, or `DAY`. You can specify multiple retention buckets and they can have different retention policies.|
| `offset_minutes_from_sunday_midnight` | Determines the minute within the hour you'd like execution to start. Setting this to zero is equivalent to midnight. |

## Work through an example schedule

In this section, you work through an example schedule. This working example is the actual default snapshot schedule set on every ThoughtSpot instance.

```

schedule {
    period {
        number: 1
        unit: HOUR
    }
    retention_policy {
     bucket {
         time {
            number: 1
            unit: HOUR
         }
         capacity: 3
     }
     bucket {
        time {
            number: 4
            unit: HOUR
        }
        capacity: 2
        }
    }
    offset_minutes_from_sunday_midnight: 0
}               

```

Under this policy, the system takes a snapshot every hour, starting at midnight. You can see that by combining the `period` of 1 hour with the midnight offset of 0.

```

    schedule {
        period {
            number: 1
            unit: HOUR
        }
        ...
        }
        offset_minutes_from_sunday_midnight: 0
    }                

```

Using this frequency, a total of 24 snapshots are taken in a day.

<table class="scheduler">
  <tbody>
    <tr>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
      <td>12</td>
      <td>13</td>
      <td>14</td>
      <td>…</td>
      <td>24</td>
    </tr>
  </tbody>
</table>

If you were to specify a `number` of 2, the frequency changes. The system creates the first snapshot at midnight, and creates subsequent snapshots every 2 hours:

| |2| |4| |6| |8| |10| |12| |14|...|24|

You use the `retention_policy` to control how many snapshots are kept. In this example, the first bucket retains a snapshot every three hours.

```

retention_policy {
    bucket {
        time {
            number: 1
            unit: HOUR
        }
        capacity: 3
    }     
    ...
 }

```

At the beginning of the fourth hour, the system discards the snapshot from the first hour. This is in accordance with  FIFO behavior. Therefore, this retention bucket contains snapshots from hours 2, 3, and 4.

|1D|2R|3R|4R|5|6|7|8|9|10|11|12|13|14|...|24|

The second bucket retains the snapshot taken at four hour intervals.

```

 retention_policy {
    ...
    bucket {
        time {
            number: 4
            unit: HOUR
        }
        capacity: 2
    }      
}

```

It retains two of these four-hour-interval snapshots at any one time. By hour 9 during the day, you have the snapshots from hour 4 and hour 8 in this second bucket.

|1|2|3|4R|5|6|7|8R|9|10|11|12|13|14|...|24|

What is in the first bucket in hour 9? The first bucket, with `number` 1 and `capacity` 3, has the snapshots from hour 9, 8, and 7.

At the end of the day, in the first bucket, you have the 22nd, 23rd, and 24th snapshot. In the second bucket, you will have the 20th hour and the 24th hour snapshots.

|1|...|12|13|14|15|16|17|18|19|20R|21|22R|23R|24R|

What if you changed the `period` frequency to every 2 hours? What is in your buckets at hour 24?

|1|...|12| |14| |16| |18R| |20R| |22R| |24R|

When defining a policy, it can be helpful to graphically represent the frequency you configure. Then, determine which time blocks are important to retain before determining your retention bucket.
