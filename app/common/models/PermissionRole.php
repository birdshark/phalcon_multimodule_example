<?php

namespace Application\Common\Models;

class PermissionRole extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Column(column="permission_id", type="integer", length=10, nullable=false)
     */
    public $permission_id;

    /**
     *
     * @var integer
     * @Primary
     * @Column(column="role_id", type="integer", length=10, nullable=false)
     */
    public $role_id;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("test");
        $this->setSource("permission_role");
        $this->belongsTo('permission_id', 'Application\Common\Models\Permissions', 'id', ['alias' => 'Permissions']);
        $this->belongsTo('role_id', 'Application\Common\Models\Roles', 'id', ['alias' => 'Roles']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'permission_role';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return PermissionRole[]|PermissionRole|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return PermissionRole|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function getPermissions($role_id){
        $phql = "SELECT a.*,b.name FROM c:PermissionRole a LEFT JOIN c:Permissions b on a.permission_id = b.id WHERE role_id = $role_id";
        $result = $this->getModelsManager()->executeQuery($phql);
        return $result;
    }

    public function getMenus($role_ids){
        $menus = array();
        $phql = "SELECT b.* FROM c:PermissionRole a LEFT JOIN c:Permissions b on a.permission_id = b.id WHERE a.role_id in ($role_ids) GROUP BY b.name";
        $permissions = $this->getModelsManager()->executeQuery($phql);
        foreach ($permissions as $permission){
            if(!array_key_exists($permission->section,$menus)){
                if($permission->show == 1) {
                    $menu['mode'] = $permission->mode;
                    $menu['flag'] = $permission->flag;
                    $menu['section'] = $permission->section;
                    $menu['pages'] = [['name' => $permission->name, 'display_name' => $permission->display_name]];
                    $menus[$permission->section] = $menu;
                }
            }else{
                if($permission->show == 1){
                    array_push($menus[$permission->section]['pages'], ['name'=>$permission->name,'display_name'=>$permission->display_name]);
                }
            }

        }
        return $menus;
    }

}
