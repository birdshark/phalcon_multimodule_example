<?php 

use Phalcon\Db\Column;
use Phalcon\Db\Index;
use Phalcon\Db\Reference;
use Phalcon\Mvc\Model\Migration;

/**
 * Class PermissionRoleMigration_100
 */
class PermissionRoleMigration_100 extends Migration
{
    /**
     * Define the table structure
     *
     * @return void
     */
    public function morph()
    {
        $this->morphTable('permission_role', [
                'columns' => [
                    new Column(
                        'permission_id',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'unsigned' => true,
                            'notNull' => true,
                            'size' => 10,
                            'first' => true
                        ]
                    ),
                    new Column(
                        'role_id',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'unsigned' => true,
                            'notNull' => true,
                            'size' => 10,
                            'after' => 'permission_id'
                        ]
                    )
                ],
                'indexes' => [
                    new Index('PRIMARY', ['permission_id', 'role_id'], 'PRIMARY'),
                    new Index('permission_role_role_id_foreign', ['role_id'], null)
                ],
                'references' => [
                    new Reference(
                        'permission_role_permission_id_foreign',
                        [
                            'referencedTable' => 'permissions',
                            'referencedSchema' => 'test',
                            'columns' => ['permission_id'],
                            'referencedColumns' => ['id'],
                            'onUpdate' => 'CASCADE',
                            'onDelete' => 'CASCADE'
                        ]
                    ),
                    new Reference(
                        'permission_role_role_id_foreign',
                        [
                            'referencedTable' => 'roles',
                            'referencedSchema' => 'test',
                            'columns' => ['role_id'],
                            'referencedColumns' => ['id'],
                            'onUpdate' => 'CASCADE',
                            'onDelete' => 'CASCADE'
                        ]
                    )
                ],
                'options' => [
                    'TABLE_TYPE' => 'BASE TABLE',
                    'AUTO_INCREMENT' => '',
                    'ENGINE' => 'InnoDB',
                    'TABLE_COLLATION' => 'utf8_general_ci'
                ],
            ]
        );
    }

    /**
     * Run the migrations
     *
     * @return void
     */
    public function up()
    {

    }

    /**
     * Reverse the migrations
     *
     * @return void
     */
    public function down()
    {

    }

}
